(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v6)
             (pred_9 ?v11 ?v9)
             (pred_11 ?v7 ?v9)
             (pred_5 ?v5 ?v7 )
	     (pred_3 ?v7)
             (pred_4 ?v10)
             (pred_8 ?v11)
             (pred_2 ?v9)
             (pred_12 ?v7)
             (pred_1 ?v11)
             (pred_10 ?v7)
             (pred_6 ))



(:action op_4
:parameters (?v1 ?v3 ?v12 ?v13)
:precondition (and (pred_4 ?v1) (pred_4 ?v3) (pred_8 ?v12) (pred_2 ?v13)
          (pred_7 ?v1 ?v3) (pred_9 ?v12 ?v13)
                   (pred_11 ?v3 ?v13) (pred_3 ?v1) 
                   (pred_12 ?v3) (pred_1 ?v12))
:effect (and  (pred_10 ?v3) (not (pred_12 ?v3))))


(:action op_1
:parameters (?v1 ?v4)
:precondition (and (pred_4 ?v1) (pred_4 ?v4)
               (pred_3 ?v1) (pred_7 ?v1 ?v4) (pred_10 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v1))))

(:action op_2
:parameters (?v1 ?v12)
:precondition (and (pred_4 ?v1) (pred_8 ?v12) 
                  (pred_3 ?v1) (pred_5 ?v12 ?v1) (pred_6 ))
:effect (and (pred_1 ?v12)
   (not (pred_5 ?v12 ?v1)) (not (pred_6 ))))


(:action op_5
:parameters (?v1 ?v8 ?v2)
:precondition (and (pred_4 ?v1) (pred_8 ?v8) (pred_8 ?v2)
                  (pred_3 ?v1) (pred_1 ?v2) (pred_5 ?v8 ?v1))
:effect (and (pred_1 ?v8) (pred_5 ?v2 ?v1)
        (not (pred_1 ?v2)) (not (pred_5 ?v8 ?v1))))

(:action op_3
:parameters (?v1 ?v12)
:precondition (and (pred_4 ?v1) (pred_8 ?v12) 
                  (pred_3 ?v1) (pred_1 ?v12))
:effect (and (pred_6 ) (pred_5 ?v12 ?v1) (not (pred_1 ?v12)))))


	
