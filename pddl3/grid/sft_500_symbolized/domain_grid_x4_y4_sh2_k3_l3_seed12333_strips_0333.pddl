(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v8)
             (pred_9 ?v7 ?v2)
             (pred_2 ?v4 ?v2)
             (pred_7 ?v11 ?v4 )
	     (pred_11 ?v4)
             (pred_12 ?v5)
             (pred_1 ?v7)
             (pred_4 ?v2)
             (pred_10 ?v4)
             (pred_3 ?v7)
             (pred_5 ?v4)
             (pred_8 ))



(:action op_3
:parameters (?v10 ?v3 ?v6 ?v13)
:precondition (and (pred_12 ?v10) (pred_12 ?v3) (pred_1 ?v6) (pred_4 ?v13)
          (pred_6 ?v10 ?v3) (pred_9 ?v6 ?v13)
                   (pred_2 ?v3 ?v13) (pred_11 ?v10) 
                   (pred_10 ?v3) (pred_3 ?v6))
:effect (and  (pred_5 ?v3) (not (pred_10 ?v3))))


(:action op_4
:parameters (?v10 ?v12)
:precondition (and (pred_12 ?v10) (pred_12 ?v12)
               (pred_11 ?v10) (pred_6 ?v10 ?v12) (pred_5 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v10))))

(:action op_5
:parameters (?v10 ?v6)
:precondition (and (pred_12 ?v10) (pred_1 ?v6) 
                  (pred_11 ?v10) (pred_7 ?v6 ?v10) (pred_8 ))
:effect (and (pred_3 ?v6)
   (not (pred_7 ?v6 ?v10)) (not (pred_8 ))))


(:action op_1
:parameters (?v10 ?v1 ?v9)
:precondition (and (pred_12 ?v10) (pred_1 ?v1) (pred_1 ?v9)
                  (pred_11 ?v10) (pred_3 ?v9) (pred_7 ?v1 ?v10))
:effect (and (pred_3 ?v1) (pred_7 ?v9 ?v10)
        (not (pred_3 ?v9)) (not (pred_7 ?v1 ?v10))))

(:action op_2
:parameters (?v10 ?v6)
:precondition (and (pred_12 ?v10) (pred_1 ?v6) 
                  (pred_11 ?v10) (pred_3 ?v6))
:effect (and (pred_8 ) (pred_7 ?v6 ?v10) (not (pred_3 ?v6)))))


	
