(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v10)
             (pred_2 ?v3 ?v12)
             (pred_8 ?v2 ?v12)
             (pred_7 ?v6 ?v2 )
	     (pred_10 ?v2)
             (pred_4 ?v11)
             (pred_12 ?v3)
             (pred_6 ?v12)
             (pred_11 ?v2)
             (pred_3 ?v3)
             (pred_1 ?v2)
             (pred_5 ))



(:action op_2
:parameters (?v5 ?v7 ?v4 ?v8)
:precondition (and (pred_4 ?v5) (pred_4 ?v7) (pred_12 ?v4) (pred_6 ?v8)
          (pred_9 ?v5 ?v7) (pred_2 ?v4 ?v8)
                   (pred_8 ?v7 ?v8) (pred_10 ?v5) 
                   (pred_11 ?v7) (pred_3 ?v4))
:effect (and  (pred_1 ?v7) (not (pred_11 ?v7))))


(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_4 ?v5) (pred_4 ?v9)
               (pred_10 ?v5) (pred_9 ?v5 ?v9) (pred_1 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v5))))

(:action op_5
:parameters (?v5 ?v4)
:precondition (and (pred_4 ?v5) (pred_12 ?v4) 
                  (pred_10 ?v5) (pred_7 ?v4 ?v5) (pred_5 ))
:effect (and (pred_3 ?v4)
   (not (pred_7 ?v4 ?v5)) (not (pred_5 ))))


(:action op_1
:parameters (?v5 ?v1 ?v13)
:precondition (and (pred_4 ?v5) (pred_12 ?v1) (pred_12 ?v13)
                  (pred_10 ?v5) (pred_3 ?v13) (pred_7 ?v1 ?v5))
:effect (and (pred_3 ?v1) (pred_7 ?v13 ?v5)
        (not (pred_3 ?v13)) (not (pred_7 ?v1 ?v5))))

(:action op_3
:parameters (?v5 ?v4)
:precondition (and (pred_4 ?v5) (pred_12 ?v4) 
                  (pred_10 ?v5) (pred_3 ?v4))
:effect (and (pred_5 ) (pred_7 ?v4 ?v5) (not (pred_3 ?v4)))))


	
