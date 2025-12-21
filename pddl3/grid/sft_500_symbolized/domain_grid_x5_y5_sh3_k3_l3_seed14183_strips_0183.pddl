(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v12)
             (pred_12 ?v11 ?v1)
             (pred_7 ?v2 ?v1)
             (pred_9 ?v6 ?v2 )
	     (pred_10 ?v2)
             (pred_11 ?v4)
             (pred_8 ?v11)
             (pred_6 ?v1)
             (pred_5 ?v2)
             (pred_1 ?v11)
             (pred_3 ?v2)
             (pred_2 ))



(:action op_5
:parameters (?v7 ?v8 ?v9 ?v10)
:precondition (and (pred_11 ?v7) (pred_11 ?v8) (pred_8 ?v9) (pred_6 ?v10)
          (pred_4 ?v7 ?v8) (pred_12 ?v9 ?v10)
                   (pred_7 ?v8 ?v10) (pred_10 ?v7) 
                   (pred_5 ?v8) (pred_1 ?v9))
:effect (and  (pred_3 ?v8) (not (pred_5 ?v8))))


(:action op_3
:parameters (?v7 ?v3)
:precondition (and (pred_11 ?v7) (pred_11 ?v3)
               (pred_10 ?v7) (pred_4 ?v7 ?v3) (pred_3 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v7))))

(:action op_2
:parameters (?v7 ?v9)
:precondition (and (pred_11 ?v7) (pred_8 ?v9) 
                  (pred_10 ?v7) (pred_9 ?v9 ?v7) (pred_2 ))
:effect (and (pred_1 ?v9)
   (not (pred_9 ?v9 ?v7)) (not (pred_2 ))))


(:action op_4
:parameters (?v7 ?v13 ?v5)
:precondition (and (pred_11 ?v7) (pred_8 ?v13) (pred_8 ?v5)
                  (pred_10 ?v7) (pred_1 ?v5) (pred_9 ?v13 ?v7))
:effect (and (pred_1 ?v13) (pred_9 ?v5 ?v7)
        (not (pred_1 ?v5)) (not (pred_9 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v9)
:precondition (and (pred_11 ?v7) (pred_8 ?v9) 
                  (pred_10 ?v7) (pred_1 ?v9))
:effect (and (pred_2 ) (pred_9 ?v9 ?v7) (not (pred_1 ?v9)))))


	
