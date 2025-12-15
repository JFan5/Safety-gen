(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v3)
             (pred_2 ?v11 ?v13)
             (pred_7 ?v6 ?v13)
             (pred_1 ?v12 ?v6 )
	     (pred_3 ?v6)
             (pred_12 ?v5)
             (pred_4 ?v11)
             (pred_5 ?v13)
             (pred_9 ?v6)
             (pred_11 ?v11)
             (pred_8 ?v6)
             (pred_6 ))



(:action op_5
:parameters (?v7 ?v8 ?v4 ?v2)
:precondition (and (pred_12 ?v7) (pred_12 ?v8) (pred_4 ?v4) (pred_5 ?v2)
          (pred_10 ?v7 ?v8) (pred_2 ?v4 ?v2)
                   (pred_7 ?v8 ?v2) (pred_3 ?v7) 
                   (pred_9 ?v8) (pred_11 ?v4))
:effect (and  (pred_8 ?v8) (not (pred_9 ?v8))))


(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_12 ?v7) (pred_12 ?v1)
               (pred_3 ?v7) (pred_10 ?v7 ?v1) (pred_8 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_12 ?v7) (pred_4 ?v4) 
                  (pred_3 ?v7) (pred_1 ?v4 ?v7) (pred_6 ))
:effect (and (pred_11 ?v4)
   (not (pred_1 ?v4 ?v7)) (not (pred_6 ))))


(:action op_1
:parameters (?v7 ?v9 ?v10)
:precondition (and (pred_12 ?v7) (pred_4 ?v9) (pred_4 ?v10)
                  (pred_3 ?v7) (pred_11 ?v10) (pred_1 ?v9 ?v7))
:effect (and (pred_11 ?v9) (pred_1 ?v10 ?v7)
        (not (pred_11 ?v10)) (not (pred_1 ?v9 ?v7))))

(:action op_3
:parameters (?v7 ?v4)
:precondition (and (pred_12 ?v7) (pred_4 ?v4) 
                  (pred_3 ?v7) (pred_11 ?v4))
:effect (and (pred_6 ) (pred_1 ?v4 ?v7) (not (pred_11 ?v4)))))


	
