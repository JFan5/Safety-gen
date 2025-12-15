(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v8)
             (pred_2 ?v4 ?v13)
             (pred_1 ?v5 ?v13)
             (pred_3 ?v2 ?v5 )
	     (pred_11 ?v5)
             (pred_7 ?v9)
             (pred_9 ?v4)
             (pred_6 ?v13)
             (pred_4 ?v5)
             (pred_8 ?v4)
             (pred_5 ?v5)
             (pred_10 ))



(:action op_3
:parameters (?v10 ?v3 ?v1 ?v11)
:precondition (and (pred_7 ?v10) (pred_7 ?v3) (pred_9 ?v1) (pred_6 ?v11)
          (pred_12 ?v10 ?v3) (pred_2 ?v1 ?v11)
                   (pred_1 ?v3 ?v11) (pred_11 ?v10) 
                   (pred_4 ?v3) (pred_8 ?v1))
:effect (and  (pred_5 ?v3) (not (pred_4 ?v3))))


(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_7 ?v10) (pred_7 ?v7)
               (pred_11 ?v10) (pred_12 ?v10 ?v7) (pred_5 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v10))))

(:action op_4
:parameters (?v10 ?v1)
:precondition (and (pred_7 ?v10) (pred_9 ?v1) 
                  (pred_11 ?v10) (pred_3 ?v1 ?v10) (pred_10 ))
:effect (and (pred_8 ?v1)
   (not (pred_3 ?v1 ?v10)) (not (pred_10 ))))


(:action op_1
:parameters (?v10 ?v6 ?v12)
:precondition (and (pred_7 ?v10) (pred_9 ?v6) (pred_9 ?v12)
                  (pred_11 ?v10) (pred_8 ?v12) (pred_3 ?v6 ?v10))
:effect (and (pred_8 ?v6) (pred_3 ?v12 ?v10)
        (not (pred_8 ?v12)) (not (pred_3 ?v6 ?v10))))

(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_7 ?v10) (pred_9 ?v1) 
                  (pred_11 ?v10) (pred_8 ?v1))
:effect (and (pred_10 ) (pred_3 ?v1 ?v10) (not (pred_8 ?v1)))))


	
