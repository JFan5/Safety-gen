(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v2)
             (pred_5 ?v5 ?v11)
             (pred_3 ?v12 ?v11)
             (pred_1 ?v1 ?v12 )
	     (pred_7 ?v12)
             (pred_10 ?v8)
             (pred_9 ?v5)
             (pred_8 ?v11)
             (pred_6 ?v12)
             (pred_11 ?v5)
             (pred_2 ?v12)
             (pred_4 ))



(:action op_4
:parameters (?v3 ?v7 ?v13 ?v4)
:precondition (and (pred_10 ?v3) (pred_10 ?v7) (pred_9 ?v13) (pred_8 ?v4)
          (pred_12 ?v3 ?v7) (pred_5 ?v13 ?v4)
                   (pred_3 ?v7 ?v4) (pred_7 ?v3) 
                   (pred_6 ?v7) (pred_11 ?v13))
:effect (and  (pred_2 ?v7) (not (pred_6 ?v7))))


(:action op_3
:parameters (?v3 ?v10)
:precondition (and (pred_10 ?v3) (pred_10 ?v10)
               (pred_7 ?v3) (pred_12 ?v3 ?v10) (pred_2 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v3))))

(:action op_1
:parameters (?v3 ?v13)
:precondition (and (pred_10 ?v3) (pred_9 ?v13) 
                  (pred_7 ?v3) (pred_1 ?v13 ?v3) (pred_4 ))
:effect (and (pred_11 ?v13)
   (not (pred_1 ?v13 ?v3)) (not (pred_4 ))))


(:action op_5
:parameters (?v3 ?v9 ?v6)
:precondition (and (pred_10 ?v3) (pred_9 ?v9) (pred_9 ?v6)
                  (pred_7 ?v3) (pred_11 ?v6) (pred_1 ?v9 ?v3))
:effect (and (pred_11 ?v9) (pred_1 ?v6 ?v3)
        (not (pred_11 ?v6)) (not (pred_1 ?v9 ?v3))))

(:action op_2
:parameters (?v3 ?v13)
:precondition (and (pred_10 ?v3) (pred_9 ?v13) 
                  (pred_7 ?v3) (pred_11 ?v13))
:effect (and (pred_4 ) (pred_1 ?v13 ?v3) (not (pred_11 ?v13)))))


	
