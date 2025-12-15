(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v11)
             (pred_9 ?v4 ?v1)
             (pred_11 ?v10 ?v1)
             (pred_4 ?v3 ?v10 )
	     (pred_3 ?v10)
             (pred_10 ?v9)
             (pred_7 ?v4)
             (pred_8 ?v1)
             (pred_2 ?v10)
             (pred_6 ?v4)
             (pred_1 ?v10)
             (pred_5 ))



(:action op_5
:parameters (?v7 ?v8 ?v13 ?v2)
:precondition (and (pred_10 ?v7) (pred_10 ?v8) (pred_7 ?v13) (pred_8 ?v2)
          (pred_12 ?v7 ?v8) (pred_9 ?v13 ?v2)
                   (pred_11 ?v8 ?v2) (pred_3 ?v7) 
                   (pred_2 ?v8) (pred_6 ?v13))
:effect (and  (pred_1 ?v8) (not (pred_2 ?v8))))


(:action op_1
:parameters (?v7 ?v5)
:precondition (and (pred_10 ?v7) (pred_10 ?v5)
               (pred_3 ?v7) (pred_12 ?v7 ?v5) (pred_1 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v7))))

(:action op_3
:parameters (?v7 ?v13)
:precondition (and (pred_10 ?v7) (pred_7 ?v13) 
                  (pred_3 ?v7) (pred_4 ?v13 ?v7) (pred_5 ))
:effect (and (pred_6 ?v13)
   (not (pred_4 ?v13 ?v7)) (not (pred_5 ))))


(:action op_2
:parameters (?v7 ?v12 ?v6)
:precondition (and (pred_10 ?v7) (pred_7 ?v12) (pred_7 ?v6)
                  (pred_3 ?v7) (pred_6 ?v6) (pred_4 ?v12 ?v7))
:effect (and (pred_6 ?v12) (pred_4 ?v6 ?v7)
        (not (pred_6 ?v6)) (not (pred_4 ?v12 ?v7))))

(:action op_4
:parameters (?v7 ?v13)
:precondition (and (pred_10 ?v7) (pred_7 ?v13) 
                  (pred_3 ?v7) (pred_6 ?v13))
:effect (and (pred_5 ) (pred_4 ?v13 ?v7) (not (pred_6 ?v13)))))


	
