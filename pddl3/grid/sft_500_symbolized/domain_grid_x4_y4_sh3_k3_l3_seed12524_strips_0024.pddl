(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v5)
             (pred_7 ?v11 ?v13)
             (pred_9 ?v4 ?v13)
             (pred_11 ?v3 ?v4 )
	     (pred_12 ?v4)
             (pred_2 ?v8)
             (pred_10 ?v11)
             (pred_5 ?v13)
             (pred_1 ?v4)
             (pred_8 ?v11)
             (pred_6 ?v4)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v10 ?v9 ?v7)
:precondition (and (pred_2 ?v1) (pred_2 ?v10) (pred_10 ?v9) (pred_5 ?v7)
          (pred_3 ?v1 ?v10) (pred_7 ?v9 ?v7)
                   (pred_9 ?v10 ?v7) (pred_12 ?v1) 
                   (pred_1 ?v10) (pred_8 ?v9))
:effect (and  (pred_6 ?v10) (not (pred_1 ?v10))))


(:action op_1
:parameters (?v1 ?v12)
:precondition (and (pred_2 ?v1) (pred_2 ?v12)
               (pred_12 ?v1) (pred_3 ?v1 ?v12) (pred_6 ?v12))
:effect (and (pred_12 ?v12) (not (pred_12 ?v1))))

(:action op_4
:parameters (?v1 ?v9)
:precondition (and (pred_2 ?v1) (pred_10 ?v9) 
                  (pred_12 ?v1) (pred_11 ?v9 ?v1) (pred_4 ))
:effect (and (pred_8 ?v9)
   (not (pred_11 ?v9 ?v1)) (not (pred_4 ))))


(:action op_5
:parameters (?v1 ?v2 ?v6)
:precondition (and (pred_2 ?v1) (pred_10 ?v2) (pred_10 ?v6)
                  (pred_12 ?v1) (pred_8 ?v6) (pred_11 ?v2 ?v1))
:effect (and (pred_8 ?v2) (pred_11 ?v6 ?v1)
        (not (pred_8 ?v6)) (not (pred_11 ?v2 ?v1))))

(:action op_3
:parameters (?v1 ?v9)
:precondition (and (pred_2 ?v1) (pred_10 ?v9) 
                  (pred_12 ?v1) (pred_8 ?v9))
:effect (and (pred_4 ) (pred_11 ?v9 ?v1) (not (pred_8 ?v9)))))


	
