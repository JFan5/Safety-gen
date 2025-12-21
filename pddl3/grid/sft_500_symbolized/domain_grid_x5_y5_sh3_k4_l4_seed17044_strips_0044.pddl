(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v3)
             (pred_10 ?v11 ?v10)
             (pred_9 ?v5 ?v10)
             (pred_3 ?v1 ?v5 )
	     (pred_5 ?v5)
             (pred_8 ?v12)
             (pred_4 ?v11)
             (pred_11 ?v10)
             (pred_7 ?v5)
             (pred_2 ?v11)
             (pred_6 ?v5)
             (pred_12 ))



(:action op_5
:parameters (?v6 ?v8 ?v4 ?v13)
:precondition (and (pred_8 ?v6) (pred_8 ?v8) (pred_4 ?v4) (pred_11 ?v13)
          (pred_1 ?v6 ?v8) (pred_10 ?v4 ?v13)
                   (pred_9 ?v8 ?v13) (pred_5 ?v6) 
                   (pred_7 ?v8) (pred_2 ?v4))
:effect (and  (pred_6 ?v8) (not (pred_7 ?v8))))


(:action op_1
:parameters (?v6 ?v7)
:precondition (and (pred_8 ?v6) (pred_8 ?v7)
               (pred_5 ?v6) (pred_1 ?v6 ?v7) (pred_6 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v6))))

(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_8 ?v6) (pred_4 ?v4) 
                  (pred_5 ?v6) (pred_3 ?v4 ?v6) (pred_12 ))
:effect (and (pred_2 ?v4)
   (not (pred_3 ?v4 ?v6)) (not (pred_12 ))))


(:action op_2
:parameters (?v6 ?v9 ?v2)
:precondition (and (pred_8 ?v6) (pred_4 ?v9) (pred_4 ?v2)
                  (pred_5 ?v6) (pred_2 ?v2) (pred_3 ?v9 ?v6))
:effect (and (pred_2 ?v9) (pred_3 ?v2 ?v6)
        (not (pred_2 ?v2)) (not (pred_3 ?v9 ?v6))))

(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_8 ?v6) (pred_4 ?v4) 
                  (pred_5 ?v6) (pred_2 ?v4))
:effect (and (pred_12 ) (pred_3 ?v4 ?v6) (not (pred_2 ?v4)))))


	
