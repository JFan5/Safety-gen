(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v12)
             (pred_9 ?v2 ?v7)
             (pred_4 ?v5 ?v7)
             (pred_7 ?v4 ?v5 )
	     (pred_5 ?v5)
             (pred_10 ?v3)
             (pred_11 ?v2)
             (pred_8 ?v7)
             (pred_12 ?v5)
             (pred_2 ?v2)
             (pred_6 ?v5)
             (pred_3 ))



(:action op_1
:parameters (?v6 ?v13 ?v9 ?v10)
:precondition (and (pred_10 ?v6) (pred_10 ?v13) (pred_11 ?v9) (pred_8 ?v10)
          (pred_1 ?v6 ?v13) (pred_9 ?v9 ?v10)
                   (pred_4 ?v13 ?v10) (pred_5 ?v6) 
                   (pred_12 ?v13) (pred_2 ?v9))
:effect (and  (pred_6 ?v13) (not (pred_12 ?v13))))


(:action op_3
:parameters (?v6 ?v11)
:precondition (and (pred_10 ?v6) (pred_10 ?v11)
               (pred_5 ?v6) (pred_1 ?v6 ?v11) (pred_6 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v6))))

(:action op_4
:parameters (?v6 ?v9)
:precondition (and (pred_10 ?v6) (pred_11 ?v9) 
                  (pred_5 ?v6) (pred_7 ?v9 ?v6) (pred_3 ))
:effect (and (pred_2 ?v9)
   (not (pred_7 ?v9 ?v6)) (not (pred_3 ))))


(:action op_5
:parameters (?v6 ?v8 ?v1)
:precondition (and (pred_10 ?v6) (pred_11 ?v8) (pred_11 ?v1)
                  (pred_5 ?v6) (pred_2 ?v1) (pred_7 ?v8 ?v6))
:effect (and (pred_2 ?v8) (pred_7 ?v1 ?v6)
        (not (pred_2 ?v1)) (not (pred_7 ?v8 ?v6))))

(:action op_2
:parameters (?v6 ?v9)
:precondition (and (pred_10 ?v6) (pred_11 ?v9) 
                  (pred_5 ?v6) (pred_2 ?v9))
:effect (and (pred_3 ) (pred_7 ?v9 ?v6) (not (pred_2 ?v9)))))


	
