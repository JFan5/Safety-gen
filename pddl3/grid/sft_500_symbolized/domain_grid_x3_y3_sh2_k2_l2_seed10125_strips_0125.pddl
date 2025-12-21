(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v4 ?v1)
             (pred_12 ?v13 ?v2)
             (pred_7 ?v4 ?v2)
             (pred_6 ?v7 ?v4 )
	     (pred_2 ?v4)
             (pred_5 ?v11)
             (pred_3 ?v13)
             (pred_4 ?v2)
             (pred_1 ?v4)
             (pred_8 ?v13)
             (pred_10 ?v4)
             (pred_11 ))



(:action op_5
:parameters (?v10 ?v8 ?v6 ?v12)
:precondition (and (pred_5 ?v10) (pred_5 ?v8) (pred_3 ?v6) (pred_4 ?v12)
          (pred_9 ?v10 ?v8) (pred_12 ?v6 ?v12)
                   (pred_7 ?v8 ?v12) (pred_2 ?v10) 
                   (pred_1 ?v8) (pred_8 ?v6))
:effect (and  (pred_10 ?v8) (not (pred_1 ?v8))))


(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_5 ?v10) (pred_5 ?v5)
               (pred_2 ?v10) (pred_9 ?v10 ?v5) (pred_10 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v10))))

(:action op_3
:parameters (?v10 ?v6)
:precondition (and (pred_5 ?v10) (pred_3 ?v6) 
                  (pred_2 ?v10) (pred_6 ?v6 ?v10) (pred_11 ))
:effect (and (pred_8 ?v6)
   (not (pred_6 ?v6 ?v10)) (not (pred_11 ))))


(:action op_2
:parameters (?v10 ?v3 ?v9)
:precondition (and (pred_5 ?v10) (pred_3 ?v3) (pred_3 ?v9)
                  (pred_2 ?v10) (pred_8 ?v9) (pred_6 ?v3 ?v10))
:effect (and (pred_8 ?v3) (pred_6 ?v9 ?v10)
        (not (pred_8 ?v9)) (not (pred_6 ?v3 ?v10))))

(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_5 ?v10) (pred_3 ?v6) 
                  (pred_2 ?v10) (pred_8 ?v6))
:effect (and (pred_11 ) (pred_6 ?v6 ?v10) (not (pred_8 ?v6)))))


	
