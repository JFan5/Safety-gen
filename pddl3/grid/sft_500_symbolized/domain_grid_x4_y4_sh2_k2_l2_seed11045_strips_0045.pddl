(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v6 ?v1)
             (pred_4 ?v4 ?v11)
             (pred_8 ?v6 ?v11)
             (pred_12 ?v2 ?v6 )
	     (pred_3 ?v6)
             (pred_6 ?v12)
             (pred_2 ?v4)
             (pred_7 ?v11)
             (pred_1 ?v6)
             (pred_11 ?v4)
             (pred_10 ?v6)
             (pred_9 ))



(:action op_2
:parameters (?v5 ?v7 ?v9 ?v8)
:precondition (and (pred_6 ?v5) (pred_6 ?v7) (pred_2 ?v9) (pred_7 ?v8)
          (pred_5 ?v5 ?v7) (pred_4 ?v9 ?v8)
                   (pred_8 ?v7 ?v8) (pred_3 ?v5) 
                   (pred_1 ?v7) (pred_11 ?v9))
:effect (and  (pred_10 ?v7) (not (pred_1 ?v7))))


(:action op_5
:parameters (?v5 ?v3)
:precondition (and (pred_6 ?v5) (pred_6 ?v3)
               (pred_3 ?v5) (pred_5 ?v5 ?v3) (pred_10 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v5))))

(:action op_1
:parameters (?v5 ?v9)
:precondition (and (pred_6 ?v5) (pred_2 ?v9) 
                  (pred_3 ?v5) (pred_12 ?v9 ?v5) (pred_9 ))
:effect (and (pred_11 ?v9)
   (not (pred_12 ?v9 ?v5)) (not (pred_9 ))))


(:action op_3
:parameters (?v5 ?v10 ?v13)
:precondition (and (pred_6 ?v5) (pred_2 ?v10) (pred_2 ?v13)
                  (pred_3 ?v5) (pred_11 ?v13) (pred_12 ?v10 ?v5))
:effect (and (pred_11 ?v10) (pred_12 ?v13 ?v5)
        (not (pred_11 ?v13)) (not (pred_12 ?v10 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_6 ?v5) (pred_2 ?v9) 
                  (pred_3 ?v5) (pred_11 ?v9))
:effect (and (pred_9 ) (pred_12 ?v9 ?v5) (not (pred_11 ?v9)))))


	
