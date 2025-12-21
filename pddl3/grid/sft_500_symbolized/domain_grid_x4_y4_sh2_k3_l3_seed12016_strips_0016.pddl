(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v10)
             (pred_1 ?v13 ?v2)
             (pred_7 ?v3 ?v2)
             (pred_2 ?v9 ?v3 )
	     (pred_3 ?v3)
             (pred_6 ?v11)
             (pred_12 ?v13)
             (pred_10 ?v2)
             (pred_11 ?v3)
             (pred_5 ?v13)
             (pred_9 ?v3)
             (pred_4 ))



(:action op_4
:parameters (?v7 ?v6 ?v4 ?v12)
:precondition (and (pred_6 ?v7) (pred_6 ?v6) (pred_12 ?v4) (pred_10 ?v12)
          (pred_8 ?v7 ?v6) (pred_1 ?v4 ?v12)
                   (pred_7 ?v6 ?v12) (pred_3 ?v7) 
                   (pred_11 ?v6) (pred_5 ?v4))
:effect (and  (pred_9 ?v6) (not (pred_11 ?v6))))


(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_6 ?v7) (pred_6 ?v1)
               (pred_3 ?v7) (pred_8 ?v7 ?v1) (pred_9 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v7))))

(:action op_3
:parameters (?v7 ?v4)
:precondition (and (pred_6 ?v7) (pred_12 ?v4) 
                  (pred_3 ?v7) (pred_2 ?v4 ?v7) (pred_4 ))
:effect (and (pred_5 ?v4)
   (not (pred_2 ?v4 ?v7)) (not (pred_4 ))))


(:action op_5
:parameters (?v7 ?v8 ?v5)
:precondition (and (pred_6 ?v7) (pred_12 ?v8) (pred_12 ?v5)
                  (pred_3 ?v7) (pred_5 ?v5) (pred_2 ?v8 ?v7))
:effect (and (pred_5 ?v8) (pred_2 ?v5 ?v7)
        (not (pred_5 ?v5)) (not (pred_2 ?v8 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_6 ?v7) (pred_12 ?v4) 
                  (pred_3 ?v7) (pred_5 ?v4))
:effect (and (pred_4 ) (pred_2 ?v4 ?v7) (not (pred_5 ?v4)))))


	
