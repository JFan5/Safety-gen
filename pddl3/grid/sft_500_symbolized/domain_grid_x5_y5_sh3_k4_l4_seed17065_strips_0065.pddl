(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v5 ?v9)
             (pred_6 ?v1 ?v3)
             (pred_9 ?v5 ?v3)
             (pred_1 ?v4 ?v5 )
	     (pred_8 ?v5)
             (pred_5 ?v12)
             (pred_12 ?v1)
             (pred_7 ?v3)
             (pred_11 ?v5)
             (pred_4 ?v1)
             (pred_2 ?v5)
             (pred_3 ))



(:action op_5
:parameters (?v10 ?v8 ?v11 ?v13)
:precondition (and (pred_5 ?v10) (pred_5 ?v8) (pred_12 ?v11) (pred_7 ?v13)
          (pred_10 ?v10 ?v8) (pred_6 ?v11 ?v13)
                   (pred_9 ?v8 ?v13) (pred_8 ?v10) 
                   (pred_11 ?v8) (pred_4 ?v11))
:effect (and  (pred_2 ?v8) (not (pred_11 ?v8))))


(:action op_1
:parameters (?v10 ?v2)
:precondition (and (pred_5 ?v10) (pred_5 ?v2)
               (pred_8 ?v10) (pred_10 ?v10 ?v2) (pred_2 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v10))))

(:action op_4
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_12 ?v11) 
                  (pred_8 ?v10) (pred_1 ?v11 ?v10) (pred_3 ))
:effect (and (pred_4 ?v11)
   (not (pred_1 ?v11 ?v10)) (not (pred_3 ))))


(:action op_2
:parameters (?v10 ?v7 ?v6)
:precondition (and (pred_5 ?v10) (pred_12 ?v7) (pred_12 ?v6)
                  (pred_8 ?v10) (pred_4 ?v6) (pred_1 ?v7 ?v10))
:effect (and (pred_4 ?v7) (pred_1 ?v6 ?v10)
        (not (pred_4 ?v6)) (not (pred_1 ?v7 ?v10))))

(:action op_3
:parameters (?v10 ?v11)
:precondition (and (pred_5 ?v10) (pred_12 ?v11) 
                  (pred_8 ?v10) (pred_4 ?v11))
:effect (and (pred_3 ) (pred_1 ?v11 ?v10) (not (pred_4 ?v11)))))


	
