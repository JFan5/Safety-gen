(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v6)
             (pred_3 ?v2 ?v3)
             (pred_7 ?v4 ?v3)
             (pred_1 ?v12 ?v4 )
	     (pred_4 ?v4)
             (pred_2 ?v10)
             (pred_6 ?v2)
             (pred_12 ?v3)
             (pred_11 ?v4)
             (pred_5 ?v2)
             (pred_9 ?v4)
             (pred_8 ))



(:action op_3
:parameters (?v8 ?v7 ?v5 ?v11)
:precondition (and (pred_2 ?v8) (pred_2 ?v7) (pred_6 ?v5) (pred_12 ?v11)
          (pred_10 ?v8 ?v7) (pred_3 ?v5 ?v11)
                   (pred_7 ?v7 ?v11) (pred_4 ?v8) 
                   (pred_11 ?v7) (pred_5 ?v5))
:effect (and  (pred_9 ?v7) (not (pred_11 ?v7))))


(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_2 ?v8) (pred_2 ?v9)
               (pred_4 ?v8) (pred_10 ?v8 ?v9) (pred_9 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v8))))

(:action op_2
:parameters (?v8 ?v5)
:precondition (and (pred_2 ?v8) (pred_6 ?v5) 
                  (pred_4 ?v8) (pred_1 ?v5 ?v8) (pred_8 ))
:effect (and (pred_5 ?v5)
   (not (pred_1 ?v5 ?v8)) (not (pred_8 ))))


(:action op_1
:parameters (?v8 ?v1 ?v13)
:precondition (and (pred_2 ?v8) (pred_6 ?v1) (pred_6 ?v13)
                  (pred_4 ?v8) (pred_5 ?v13) (pred_1 ?v1 ?v8))
:effect (and (pred_5 ?v1) (pred_1 ?v13 ?v8)
        (not (pred_5 ?v13)) (not (pred_1 ?v1 ?v8))))

(:action op_4
:parameters (?v8 ?v5)
:precondition (and (pred_2 ?v8) (pred_6 ?v5) 
                  (pred_4 ?v8) (pred_5 ?v5))
:effect (and (pred_8 ) (pred_1 ?v5 ?v8) (not (pred_5 ?v5)))))


	
