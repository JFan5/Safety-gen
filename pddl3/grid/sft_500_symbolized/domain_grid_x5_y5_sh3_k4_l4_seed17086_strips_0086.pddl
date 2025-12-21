(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v7)
             (pred_11 ?v12 ?v2)
             (pred_8 ?v8 ?v2)
             (pred_10 ?v1 ?v8 )
	     (pred_2 ?v8)
             (pred_5 ?v13)
             (pred_6 ?v12)
             (pred_9 ?v2)
             (pred_1 ?v8)
             (pred_3 ?v12)
             (pred_7 ?v8)
             (pred_12 ))



(:action op_4
:parameters (?v10 ?v4 ?v11 ?v3)
:precondition (and (pred_5 ?v10) (pred_5 ?v4) (pred_6 ?v11) (pred_9 ?v3)
          (pred_4 ?v10 ?v4) (pred_11 ?v11 ?v3)
                   (pred_8 ?v4 ?v3) (pred_2 ?v10) 
                   (pred_1 ?v4) (pred_3 ?v11))
:effect (and  (pred_7 ?v4) (not (pred_1 ?v4))))


(:action op_3
:parameters (?v10 ?v6)
:precondition (and (pred_5 ?v10) (pred_5 ?v6)
               (pred_2 ?v10) (pred_4 ?v10 ?v6) (pred_7 ?v6))
:effect (and (pred_2 ?v6) (not (pred_2 ?v10))))

(:action op_2
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_6 ?v11) 
                  (pred_2 ?v10) (pred_10 ?v11 ?v10) (pred_12 ))
:effect (and (pred_3 ?v11)
   (not (pred_10 ?v11 ?v10)) (not (pred_12 ))))


(:action op_1
:parameters (?v10 ?v5 ?v9)
:precondition (and (pred_5 ?v10) (pred_6 ?v5) (pred_6 ?v9)
                  (pred_2 ?v10) (pred_3 ?v9) (pred_10 ?v5 ?v10))
:effect (and (pred_3 ?v5) (pred_10 ?v9 ?v10)
        (not (pred_3 ?v9)) (not (pred_10 ?v5 ?v10))))

(:action op_5
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_6 ?v11) 
                  (pred_2 ?v10) (pred_3 ?v11))
:effect (and (pred_12 ) (pred_10 ?v11 ?v10) (not (pred_3 ?v11)))))


	
