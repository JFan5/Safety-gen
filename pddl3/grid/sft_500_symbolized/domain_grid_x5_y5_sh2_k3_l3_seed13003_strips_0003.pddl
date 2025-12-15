(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v7)
             (pred_2 ?v3 ?v4)
             (pred_8 ?v9 ?v4)
             (pred_3 ?v13 ?v9 )
	     (pred_6 ?v9)
             (pred_5 ?v8)
             (pred_4 ?v3)
             (pred_1 ?v4)
             (pred_12 ?v9)
             (pred_7 ?v3)
             (pred_11 ?v9)
             (pred_10 ))



(:action op_5
:parameters (?v10 ?v2 ?v11 ?v1)
:precondition (and (pred_5 ?v10) (pred_5 ?v2) (pred_4 ?v11) (pred_1 ?v1)
          (pred_9 ?v10 ?v2) (pred_2 ?v11 ?v1)
                   (pred_8 ?v2 ?v1) (pred_6 ?v10) 
                   (pred_12 ?v2) (pred_7 ?v11))
:effect (and  (pred_11 ?v2) (not (pred_12 ?v2))))


(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_5 ?v10) (pred_5 ?v6)
               (pred_6 ?v10) (pred_9 ?v10 ?v6) (pred_11 ?v6))
:effect (and (pred_6 ?v6) (not (pred_6 ?v10))))

(:action op_4
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_4 ?v11) 
                  (pred_6 ?v10) (pred_3 ?v11 ?v10) (pred_10 ))
:effect (and (pred_7 ?v11)
   (not (pred_3 ?v11 ?v10)) (not (pred_10 ))))


(:action op_3
:parameters (?v10 ?v12 ?v5)
:precondition (and (pred_5 ?v10) (pred_4 ?v12) (pred_4 ?v5)
                  (pred_6 ?v10) (pred_7 ?v5) (pred_3 ?v12 ?v10))
:effect (and (pred_7 ?v12) (pred_3 ?v5 ?v10)
        (not (pred_7 ?v5)) (not (pred_3 ?v12 ?v10))))

(:action op_2
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_4 ?v11) 
                  (pred_6 ?v10) (pred_7 ?v11))
:effect (and (pred_10 ) (pred_3 ?v11 ?v10) (not (pred_7 ?v11)))))


	
