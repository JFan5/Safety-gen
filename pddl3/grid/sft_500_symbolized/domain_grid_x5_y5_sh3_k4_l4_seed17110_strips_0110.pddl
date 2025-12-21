(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v3 ?v10)
             (pred_12 ?v2 ?v5)
             (pred_8 ?v3 ?v5)
             (pred_4 ?v1 ?v3 )
	     (pred_5 ?v3)
             (pred_7 ?v11)
             (pred_1 ?v2)
             (pred_11 ?v5)
             (pred_9 ?v3)
             (pred_2 ?v2)
             (pred_10 ?v3)
             (pred_6 ))



(:action op_3
:parameters (?v8 ?v12 ?v4 ?v13)
:precondition (and (pred_7 ?v8) (pred_7 ?v12) (pred_1 ?v4) (pred_11 ?v13)
          (pred_3 ?v8 ?v12) (pred_12 ?v4 ?v13)
                   (pred_8 ?v12 ?v13) (pred_5 ?v8) 
                   (pred_9 ?v12) (pred_2 ?v4))
:effect (and  (pred_10 ?v12) (not (pred_9 ?v12))))


(:action op_2
:parameters (?v8 ?v9)
:precondition (and (pred_7 ?v8) (pred_7 ?v9)
               (pred_5 ?v8) (pred_3 ?v8 ?v9) (pred_10 ?v9))
:effect (and (pred_5 ?v9) (not (pred_5 ?v8))))

(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_7 ?v8) (pred_1 ?v4) 
                  (pred_5 ?v8) (pred_4 ?v4 ?v8) (pred_6 ))
:effect (and (pred_2 ?v4)
   (not (pred_4 ?v4 ?v8)) (not (pred_6 ))))


(:action op_1
:parameters (?v8 ?v7 ?v6)
:precondition (and (pred_7 ?v8) (pred_1 ?v7) (pred_1 ?v6)
                  (pred_5 ?v8) (pred_2 ?v6) (pred_4 ?v7 ?v8))
:effect (and (pred_2 ?v7) (pred_4 ?v6 ?v8)
        (not (pred_2 ?v6)) (not (pred_4 ?v7 ?v8))))

(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_7 ?v8) (pred_1 ?v4) 
                  (pred_5 ?v8) (pred_2 ?v4))
:effect (and (pred_6 ) (pred_4 ?v4 ?v8) (not (pred_2 ?v4)))))


	
