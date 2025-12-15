(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v6 ?v2)
             (pred_12 ?v3 ?v11)
             (pred_6 ?v6 ?v11)
             (pred_4 ?v5 ?v6 )
	     (pred_1 ?v6)
             (pred_8 ?v12)
             (pred_2 ?v3)
             (pred_3 ?v11)
             (pred_10 ?v6)
             (pred_7 ?v3)
             (pred_11 ?v6)
             (pred_9 ))



(:action op_2
:parameters (?v10 ?v8 ?v7 ?v13)
:precondition (and (pred_8 ?v10) (pred_8 ?v8) (pred_2 ?v7) (pred_3 ?v13)
          (pred_5 ?v10 ?v8) (pred_12 ?v7 ?v13)
                   (pred_6 ?v8 ?v13) (pred_1 ?v10) 
                   (pred_10 ?v8) (pred_7 ?v7))
:effect (and  (pred_11 ?v8) (not (pred_10 ?v8))))


(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_8 ?v10) (pred_8 ?v1)
               (pred_1 ?v10) (pred_5 ?v10 ?v1) (pred_11 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v10))))

(:action op_1
:parameters (?v10 ?v7)
:precondition (and (pred_8 ?v10) (pred_2 ?v7) 
                  (pred_1 ?v10) (pred_4 ?v7 ?v10) (pred_9 ))
:effect (and (pred_7 ?v7)
   (not (pred_4 ?v7 ?v10)) (not (pred_9 ))))


(:action op_3
:parameters (?v10 ?v4 ?v9)
:precondition (and (pred_8 ?v10) (pred_2 ?v4) (pred_2 ?v9)
                  (pred_1 ?v10) (pred_7 ?v9) (pred_4 ?v4 ?v10))
:effect (and (pred_7 ?v4) (pred_4 ?v9 ?v10)
        (not (pred_7 ?v9)) (not (pred_4 ?v4 ?v10))))

(:action op_4
:parameters (?v10 ?v7)
:precondition (and (pred_8 ?v10) (pred_2 ?v7) 
                  (pred_1 ?v10) (pred_7 ?v7))
:effect (and (pred_9 ) (pred_4 ?v7 ?v10) (not (pred_7 ?v7)))))


	
