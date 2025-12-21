(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v7)
             (pred_10 ?v10 ?v8)
             (pred_3 ?v12 ?v8)
             (pred_2 ?v5 ?v12 )
	     (pred_5 ?v12)
             (pred_8 ?v6)
             (pred_12 ?v10)
             (pred_6 ?v8)
             (pred_9 ?v12)
             (pred_7 ?v10)
             (pred_11 ?v12)
             (pred_1 ))



(:action op_5
:parameters (?v1 ?v13 ?v2 ?v9)
:precondition (and (pred_8 ?v1) (pred_8 ?v13) (pred_12 ?v2) (pred_6 ?v9)
          (pred_4 ?v1 ?v13) (pred_10 ?v2 ?v9)
                   (pred_3 ?v13 ?v9) (pred_5 ?v1) 
                   (pred_9 ?v13) (pred_7 ?v2))
:effect (and  (pred_11 ?v13) (not (pred_9 ?v13))))


(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_8 ?v1) (pred_8 ?v3)
               (pred_5 ?v1) (pred_4 ?v1 ?v3) (pred_11 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v1))))

(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_8 ?v1) (pred_12 ?v2) 
                  (pred_5 ?v1) (pred_2 ?v2 ?v1) (pred_1 ))
:effect (and (pred_7 ?v2)
   (not (pred_2 ?v2 ?v1)) (not (pred_1 ))))


(:action op_1
:parameters (?v1 ?v11 ?v4)
:precondition (and (pred_8 ?v1) (pred_12 ?v11) (pred_12 ?v4)
                  (pred_5 ?v1) (pred_7 ?v4) (pred_2 ?v11 ?v1))
:effect (and (pred_7 ?v11) (pred_2 ?v4 ?v1)
        (not (pred_7 ?v4)) (not (pred_2 ?v11 ?v1))))

(:action op_4
:parameters (?v1 ?v2)
:precondition (and (pred_8 ?v1) (pred_12 ?v2) 
                  (pred_5 ?v1) (pred_7 ?v2))
:effect (and (pred_1 ) (pred_2 ?v2 ?v1) (not (pred_7 ?v2)))))


	
