(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v7)
             (pred_10 ?v3 ?v9)
             (pred_5 ?v6 ?v9)
             (pred_2 ?v11 ?v6 )
	     (pred_8 ?v6)
             (pred_4 ?v10)
             (pred_11 ?v3)
             (pred_1 ?v9)
             (pred_9 ?v6)
             (pred_7 ?v3)
             (pred_6 ?v6)
             (pred_3 ))



(:action op_3
:parameters (?v4 ?v13 ?v2 ?v1)
:precondition (and (pred_4 ?v4) (pred_4 ?v13) (pred_11 ?v2) (pred_1 ?v1)
          (pred_12 ?v4 ?v13) (pred_10 ?v2 ?v1)
                   (pred_5 ?v13 ?v1) (pred_8 ?v4) 
                   (pred_9 ?v13) (pred_7 ?v2))
:effect (and  (pred_6 ?v13) (not (pred_9 ?v13))))


(:action op_1
:parameters (?v4 ?v8)
:precondition (and (pred_4 ?v4) (pred_4 ?v8)
               (pred_8 ?v4) (pred_12 ?v4 ?v8) (pred_6 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v4))))

(:action op_4
:parameters (?v4 ?v2)
:precondition (and (pred_4 ?v4) (pred_11 ?v2) 
                  (pred_8 ?v4) (pred_2 ?v2 ?v4) (pred_3 ))
:effect (and (pred_7 ?v2)
   (not (pred_2 ?v2 ?v4)) (not (pred_3 ))))


(:action op_2
:parameters (?v4 ?v12 ?v5)
:precondition (and (pred_4 ?v4) (pred_11 ?v12) (pred_11 ?v5)
                  (pred_8 ?v4) (pred_7 ?v5) (pred_2 ?v12 ?v4))
:effect (and (pred_7 ?v12) (pred_2 ?v5 ?v4)
        (not (pred_7 ?v5)) (not (pred_2 ?v12 ?v4))))

(:action op_5
:parameters (?v4 ?v2)
:precondition (and (pred_4 ?v4) (pred_11 ?v2) 
                  (pred_8 ?v4) (pred_7 ?v2))
:effect (and (pred_3 ) (pred_2 ?v2 ?v4) (not (pred_7 ?v2)))))


	
