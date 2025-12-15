(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v2)
             (pred_7 ?v5 ?v4)
             (pred_8 ?v9 ?v4)
             (pred_2 ?v7 ?v9 )
	     (pred_6 ?v9)
             (pred_3 ?v12)
             (pred_12 ?v5)
             (pred_11 ?v4)
             (pred_10 ?v9)
             (pred_9 ?v5)
             (pred_1 ?v9)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v13 ?v3 ?v6)
:precondition (and (pred_3 ?v1) (pred_3 ?v13) (pred_12 ?v3) (pred_11 ?v6)
          (pred_5 ?v1 ?v13) (pred_7 ?v3 ?v6)
                   (pred_8 ?v13 ?v6) (pred_6 ?v1) 
                   (pred_10 ?v13) (pred_9 ?v3))
:effect (and  (pred_1 ?v13) (not (pred_10 ?v13))))


(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_3 ?v11)
               (pred_6 ?v1) (pred_5 ?v1 ?v11) (pred_1 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v1))))

(:action op_1
:parameters (?v1 ?v3)
:precondition (and (pred_3 ?v1) (pred_12 ?v3) 
                  (pred_6 ?v1) (pred_2 ?v3 ?v1) (pred_4 ))
:effect (and (pred_9 ?v3)
   (not (pred_2 ?v3 ?v1)) (not (pred_4 ))))


(:action op_4
:parameters (?v1 ?v8 ?v10)
:precondition (and (pred_3 ?v1) (pred_12 ?v8) (pred_12 ?v10)
                  (pred_6 ?v1) (pred_9 ?v10) (pred_2 ?v8 ?v1))
:effect (and (pred_9 ?v8) (pred_2 ?v10 ?v1)
        (not (pred_9 ?v10)) (not (pred_2 ?v8 ?v1))))

(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_3 ?v1) (pred_12 ?v3) 
                  (pred_6 ?v1) (pred_9 ?v3))
:effect (and (pred_4 ) (pred_2 ?v3 ?v1) (not (pred_9 ?v3)))))


	
