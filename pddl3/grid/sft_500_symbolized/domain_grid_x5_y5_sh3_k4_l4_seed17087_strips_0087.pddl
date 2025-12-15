(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v6)
             (pred_4 ?v9 ?v11)
             (pred_7 ?v10 ?v11)
             (pred_9 ?v5 ?v10 )
	     (pred_5 ?v10)
             (pred_11 ?v7)
             (pred_8 ?v9)
             (pred_1 ?v11)
             (pred_12 ?v10)
             (pred_3 ?v9)
             (pred_6 ?v10)
             (pred_2 ))



(:action op_3
:parameters (?v13 ?v2 ?v3 ?v4)
:precondition (and (pred_11 ?v13) (pred_11 ?v2) (pred_8 ?v3) (pred_1 ?v4)
          (pred_10 ?v13 ?v2) (pred_4 ?v3 ?v4)
                   (pred_7 ?v2 ?v4) (pred_5 ?v13) 
                   (pred_12 ?v2) (pred_3 ?v3))
:effect (and  (pred_6 ?v2) (not (pred_12 ?v2))))


(:action op_2
:parameters (?v13 ?v1)
:precondition (and (pred_11 ?v13) (pred_11 ?v1)
               (pred_5 ?v13) (pred_10 ?v13 ?v1) (pred_6 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v13))))

(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_11 ?v13) (pred_8 ?v3) 
                  (pred_5 ?v13) (pred_9 ?v3 ?v13) (pred_2 ))
:effect (and (pred_3 ?v3)
   (not (pred_9 ?v3 ?v13)) (not (pred_2 ))))


(:action op_4
:parameters (?v13 ?v12 ?v8)
:precondition (and (pred_11 ?v13) (pred_8 ?v12) (pred_8 ?v8)
                  (pred_5 ?v13) (pred_3 ?v8) (pred_9 ?v12 ?v13))
:effect (and (pred_3 ?v12) (pred_9 ?v8 ?v13)
        (not (pred_3 ?v8)) (not (pred_9 ?v12 ?v13))))

(:action op_1
:parameters (?v13 ?v3)
:precondition (and (pred_11 ?v13) (pred_8 ?v3) 
                  (pred_5 ?v13) (pred_3 ?v3))
:effect (and (pred_2 ) (pred_9 ?v3 ?v13) (not (pred_3 ?v3)))))


	
