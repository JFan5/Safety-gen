(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v10 ?v2)
             (pred_3 ?v1 ?v8)
             (pred_8 ?v10 ?v8)
             (pred_6 ?v11 ?v10 )
	     (pred_10 ?v10)
             (pred_4 ?v6)
             (pred_1 ?v1)
             (pred_12 ?v8)
             (pred_2 ?v10)
             (pred_11 ?v1)
             (pred_7 ?v10)
             (pred_9 ))



(:action op_4
:parameters (?v7 ?v3 ?v4 ?v5)
:precondition (and (pred_4 ?v7) (pred_4 ?v3) (pred_1 ?v4) (pred_12 ?v5)
          (pred_5 ?v7 ?v3) (pred_3 ?v4 ?v5)
                   (pred_8 ?v3 ?v5) (pred_10 ?v7) 
                   (pred_2 ?v3) (pred_11 ?v4))
:effect (and  (pred_7 ?v3) (not (pred_2 ?v3))))


(:action op_5
:parameters (?v7 ?v9)
:precondition (and (pred_4 ?v7) (pred_4 ?v9)
               (pred_10 ?v7) (pred_5 ?v7 ?v9) (pred_7 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_4 ?v7) (pred_1 ?v4) 
                  (pred_10 ?v7) (pred_6 ?v4 ?v7) (pred_9 ))
:effect (and (pred_11 ?v4)
   (not (pred_6 ?v4 ?v7)) (not (pred_9 ))))


(:action op_3
:parameters (?v7 ?v13 ?v12)
:precondition (and (pred_4 ?v7) (pred_1 ?v13) (pred_1 ?v12)
                  (pred_10 ?v7) (pred_11 ?v12) (pred_6 ?v13 ?v7))
:effect (and (pred_11 ?v13) (pred_6 ?v12 ?v7)
        (not (pred_11 ?v12)) (not (pred_6 ?v13 ?v7))))

(:action op_2
:parameters (?v7 ?v4)
:precondition (and (pred_4 ?v7) (pred_1 ?v4) 
                  (pred_10 ?v7) (pred_11 ?v4))
:effect (and (pred_9 ) (pred_6 ?v4 ?v7) (not (pred_11 ?v4)))))


	
