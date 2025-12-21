(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v10)
             (pred_10 ?v7 ?v6)
             (pred_8 ?v5 ?v6)
             (pred_5 ?v11 ?v5 )
	     (pred_12 ?v5)
             (pred_6 ?v1)
             (pred_9 ?v7)
             (pred_11 ?v6)
             (pred_1 ?v5)
             (pred_2 ?v7)
             (pred_3 ?v5)
             (pred_7 ))



(:action op_1
:parameters (?v3 ?v13 ?v2 ?v8)
:precondition (and (pred_6 ?v3) (pred_6 ?v13) (pred_9 ?v2) (pred_11 ?v8)
          (pred_4 ?v3 ?v13) (pred_10 ?v2 ?v8)
                   (pred_8 ?v13 ?v8) (pred_12 ?v3) 
                   (pred_1 ?v13) (pred_2 ?v2))
:effect (and  (pred_3 ?v13) (not (pred_1 ?v13))))


(:action op_2
:parameters (?v3 ?v9)
:precondition (and (pred_6 ?v3) (pred_6 ?v9)
               (pred_12 ?v3) (pred_4 ?v3 ?v9) (pred_3 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v3))))

(:action op_4
:parameters (?v3 ?v2)
:precondition (and (pred_6 ?v3) (pred_9 ?v2) 
                  (pred_12 ?v3) (pred_5 ?v2 ?v3) (pred_7 ))
:effect (and (pred_2 ?v2)
   (not (pred_5 ?v2 ?v3)) (not (pred_7 ))))


(:action op_3
:parameters (?v3 ?v4 ?v12)
:precondition (and (pred_6 ?v3) (pred_9 ?v4) (pred_9 ?v12)
                  (pred_12 ?v3) (pred_2 ?v12) (pred_5 ?v4 ?v3))
:effect (and (pred_2 ?v4) (pred_5 ?v12 ?v3)
        (not (pred_2 ?v12)) (not (pred_5 ?v4 ?v3))))

(:action op_5
:parameters (?v3 ?v2)
:precondition (and (pred_6 ?v3) (pred_9 ?v2) 
                  (pred_12 ?v3) (pred_2 ?v2))
:effect (and (pred_7 ) (pred_5 ?v2 ?v3) (not (pred_2 ?v2)))))


	
