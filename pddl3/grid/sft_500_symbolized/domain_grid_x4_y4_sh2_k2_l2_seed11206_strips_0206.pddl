(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v9)
             (pred_2 ?v12 ?v3)
             (pred_8 ?v11 ?v3)
             (pred_4 ?v4 ?v11 )
	     (pred_5 ?v11)
             (pred_3 ?v13)
             (pred_12 ?v12)
             (pred_10 ?v3)
             (pred_11 ?v11)
             (pred_1 ?v12)
             (pred_7 ?v11)
             (pred_9 ))



(:action op_5
:parameters (?v10 ?v2 ?v6 ?v1)
:precondition (and (pred_3 ?v10) (pred_3 ?v2) (pred_12 ?v6) (pred_10 ?v1)
          (pred_6 ?v10 ?v2) (pred_2 ?v6 ?v1)
                   (pred_8 ?v2 ?v1) (pred_5 ?v10) 
                   (pred_11 ?v2) (pred_1 ?v6))
:effect (and  (pred_7 ?v2) (not (pred_11 ?v2))))


(:action op_2
:parameters (?v10 ?v8)
:precondition (and (pred_3 ?v10) (pred_3 ?v8)
               (pred_5 ?v10) (pred_6 ?v10 ?v8) (pred_7 ?v8))
:effect (and (pred_5 ?v8) (not (pred_5 ?v10))))

(:action op_3
:parameters (?v10 ?v6)
:precondition (and (pred_3 ?v10) (pred_12 ?v6) 
                  (pred_5 ?v10) (pred_4 ?v6 ?v10) (pred_9 ))
:effect (and (pred_1 ?v6)
   (not (pred_4 ?v6 ?v10)) (not (pred_9 ))))


(:action op_4
:parameters (?v10 ?v5 ?v7)
:precondition (and (pred_3 ?v10) (pred_12 ?v5) (pred_12 ?v7)
                  (pred_5 ?v10) (pred_1 ?v7) (pred_4 ?v5 ?v10))
:effect (and (pred_1 ?v5) (pred_4 ?v7 ?v10)
        (not (pred_1 ?v7)) (not (pred_4 ?v5 ?v10))))

(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_3 ?v10) (pred_12 ?v6) 
                  (pred_5 ?v10) (pred_1 ?v6))
:effect (and (pred_9 ) (pred_4 ?v6 ?v10) (not (pred_1 ?v6)))))


	
