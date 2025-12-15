(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v1)
             (pred_10 ?v8 ?v2)
             (pred_4 ?v12 ?v2)
             (pred_12 ?v3 ?v12 )
	     (pred_8 ?v12)
             (pred_9 ?v13)
             (pred_3 ?v8)
             (pred_7 ?v2)
             (pred_11 ?v12)
             (pred_5 ?v8)
             (pred_6 ?v12)
             (pred_2 ))



(:action op_5
:parameters (?v10 ?v5 ?v6 ?v9)
:precondition (and (pred_9 ?v10) (pred_9 ?v5) (pred_3 ?v6) (pred_7 ?v9)
          (pred_1 ?v10 ?v5) (pred_10 ?v6 ?v9)
                   (pred_4 ?v5 ?v9) (pred_8 ?v10) 
                   (pred_11 ?v5) (pred_5 ?v6))
:effect (and  (pred_6 ?v5) (not (pred_11 ?v5))))


(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_9 ?v10) (pred_9 ?v7)
               (pred_8 ?v10) (pred_1 ?v10 ?v7) (pred_6 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v10))))

(:action op_1
:parameters (?v10 ?v6)
:precondition (and (pred_9 ?v10) (pred_3 ?v6) 
                  (pred_8 ?v10) (pred_12 ?v6 ?v10) (pred_2 ))
:effect (and (pred_5 ?v6)
   (not (pred_12 ?v6 ?v10)) (not (pred_2 ))))


(:action op_3
:parameters (?v10 ?v4 ?v11)
:precondition (and (pred_9 ?v10) (pred_3 ?v4) (pred_3 ?v11)
                  (pred_8 ?v10) (pred_5 ?v11) (pred_12 ?v4 ?v10))
:effect (and (pred_5 ?v4) (pred_12 ?v11 ?v10)
        (not (pred_5 ?v11)) (not (pred_12 ?v4 ?v10))))

(:action op_4
:parameters (?v10 ?v6)
:precondition (and (pred_9 ?v10) (pred_3 ?v6) 
                  (pred_8 ?v10) (pred_5 ?v6))
:effect (and (pred_2 ) (pred_12 ?v6 ?v10) (not (pred_5 ?v6)))))


	
