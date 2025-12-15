(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v3)
             (pred_1 ?v12 ?v10)
             (pred_9 ?v8 ?v10)
             (pred_2 ?v5 ?v8 )
	     (pred_11 ?v8)
             (pred_5 ?v6)
             (pred_4 ?v12)
             (pred_10 ?v10)
             (pred_6 ?v8)
             (pred_3 ?v12)
             (pred_12 ?v8)
             (pred_7 ))



(:action op_3
:parameters (?v2 ?v13 ?v4 ?v7)
:precondition (and (pred_5 ?v2) (pred_5 ?v13) (pred_4 ?v4) (pred_10 ?v7)
          (pred_8 ?v2 ?v13) (pred_1 ?v4 ?v7)
                   (pred_9 ?v13 ?v7) (pred_11 ?v2) 
                   (pred_6 ?v13) (pred_3 ?v4))
:effect (and  (pred_12 ?v13) (not (pred_6 ?v13))))


(:action op_1
:parameters (?v2 ?v9)
:precondition (and (pred_5 ?v2) (pred_5 ?v9)
               (pred_11 ?v2) (pred_8 ?v2 ?v9) (pred_12 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v2))))

(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_5 ?v2) (pred_4 ?v4) 
                  (pred_11 ?v2) (pred_2 ?v4 ?v2) (pred_7 ))
:effect (and (pred_3 ?v4)
   (not (pred_2 ?v4 ?v2)) (not (pred_7 ))))


(:action op_5
:parameters (?v2 ?v11 ?v1)
:precondition (and (pred_5 ?v2) (pred_4 ?v11) (pred_4 ?v1)
                  (pred_11 ?v2) (pred_3 ?v1) (pred_2 ?v11 ?v2))
:effect (and (pred_3 ?v11) (pred_2 ?v1 ?v2)
        (not (pred_3 ?v1)) (not (pred_2 ?v11 ?v2))))

(:action op_2
:parameters (?v2 ?v4)
:precondition (and (pred_5 ?v2) (pred_4 ?v4) 
                  (pred_11 ?v2) (pred_3 ?v4))
:effect (and (pred_7 ) (pred_2 ?v4 ?v2) (not (pred_3 ?v4)))))


	
