(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v1 ?v3)
             (pred_5 ?v5 ?v7)
             (pred_7 ?v1 ?v7)
             (pred_8 ?v12 ?v1 )
	     (pred_11 ?v1)
             (pred_12 ?v11)
             (pred_1 ?v5)
             (pred_10 ?v7)
             (pred_4 ?v1)
             (pred_2 ?v5)
             (pred_6 ?v1)
             (pred_3 ))



(:action op_3
:parameters (?v6 ?v10 ?v8 ?v13)
:precondition (and (pred_12 ?v6) (pred_12 ?v10) (pred_1 ?v8) (pred_10 ?v13)
          (pred_9 ?v6 ?v10) (pred_5 ?v8 ?v13)
                   (pred_7 ?v10 ?v13) (pred_11 ?v6) 
                   (pred_4 ?v10) (pred_2 ?v8))
:effect (and  (pred_6 ?v10) (not (pred_4 ?v10))))


(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_12 ?v6) (pred_12 ?v4)
               (pred_11 ?v6) (pred_9 ?v6 ?v4) (pred_6 ?v4))
:effect (and (pred_11 ?v4) (not (pred_11 ?v6))))

(:action op_1
:parameters (?v6 ?v8)
:precondition (and (pred_12 ?v6) (pred_1 ?v8) 
                  (pred_11 ?v6) (pred_8 ?v8 ?v6) (pred_3 ))
:effect (and (pred_2 ?v8)
   (not (pred_8 ?v8 ?v6)) (not (pred_3 ))))


(:action op_2
:parameters (?v6 ?v2 ?v9)
:precondition (and (pred_12 ?v6) (pred_1 ?v2) (pred_1 ?v9)
                  (pred_11 ?v6) (pred_2 ?v9) (pred_8 ?v2 ?v6))
:effect (and (pred_2 ?v2) (pred_8 ?v9 ?v6)
        (not (pred_2 ?v9)) (not (pred_8 ?v2 ?v6))))

(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_12 ?v6) (pred_1 ?v8) 
                  (pred_11 ?v6) (pred_2 ?v8))
:effect (and (pred_3 ) (pred_8 ?v8 ?v6) (not (pred_2 ?v8)))))


	
