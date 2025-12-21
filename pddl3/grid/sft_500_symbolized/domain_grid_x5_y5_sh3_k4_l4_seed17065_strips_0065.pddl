(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v13)
             (pred_9 ?v3 ?v2)
             (pred_3 ?v7 ?v2)
             (pred_1 ?v12 ?v7 )
	     (pred_12 ?v7)
             (pred_11 ?v4)
             (pred_6 ?v3)
             (pred_8 ?v2)
             (pred_5 ?v7)
             (pred_2 ?v3)
             (pred_7 ?v7)
             (pred_10 ))



(:action op_1
:parameters (?v5 ?v10 ?v6 ?v1)
:precondition (and (pred_11 ?v5) (pred_11 ?v10) (pred_6 ?v6) (pred_8 ?v1)
          (pred_4 ?v5 ?v10) (pred_9 ?v6 ?v1)
                   (pred_3 ?v10 ?v1) (pred_12 ?v5) 
                   (pred_5 ?v10) (pred_2 ?v6))
:effect (and  (pred_7 ?v10) (not (pred_5 ?v10))))


(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_11 ?v5) (pred_11 ?v11)
               (pred_12 ?v5) (pred_4 ?v5 ?v11) (pred_7 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v5))))

(:action op_3
:parameters (?v5 ?v6)
:precondition (and (pred_11 ?v5) (pred_6 ?v6) 
                  (pred_12 ?v5) (pred_1 ?v6 ?v5) (pred_10 ))
:effect (and (pred_2 ?v6)
   (not (pred_1 ?v6 ?v5)) (not (pred_10 ))))


(:action op_2
:parameters (?v5 ?v8 ?v9)
:precondition (and (pred_11 ?v5) (pred_6 ?v8) (pred_6 ?v9)
                  (pred_12 ?v5) (pred_2 ?v9) (pred_1 ?v8 ?v5))
:effect (and (pred_2 ?v8) (pred_1 ?v9 ?v5)
        (not (pred_2 ?v9)) (not (pred_1 ?v8 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_11 ?v5) (pred_6 ?v6) 
                  (pred_12 ?v5) (pred_2 ?v6))
:effect (and (pred_10 ) (pred_1 ?v6 ?v5) (not (pred_2 ?v6)))))


	
