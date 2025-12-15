(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v2)
             (pred_5 ?v9 ?v4)
             (pred_12 ?v7 ?v4)
             (pred_4 ?v12 ?v7 )
	     (pred_7 ?v7)
             (pred_3 ?v11)
             (pred_8 ?v9)
             (pred_10 ?v4)
             (pred_11 ?v7)
             (pred_6 ?v9)
             (pred_2 ?v7)
             (pred_1 ))



(:action op_4
:parameters (?v6 ?v13 ?v3 ?v1)
:precondition (and (pred_3 ?v6) (pred_3 ?v13) (pred_8 ?v3) (pred_10 ?v1)
          (pred_9 ?v6 ?v13) (pred_5 ?v3 ?v1)
                   (pred_12 ?v13 ?v1) (pred_7 ?v6) 
                   (pred_11 ?v13) (pred_6 ?v3))
:effect (and  (pred_2 ?v13) (not (pred_11 ?v13))))


(:action op_5
:parameters (?v6 ?v10)
:precondition (and (pred_3 ?v6) (pred_3 ?v10)
               (pred_7 ?v6) (pred_9 ?v6 ?v10) (pred_2 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v6))))

(:action op_3
:parameters (?v6 ?v3)
:precondition (and (pred_3 ?v6) (pred_8 ?v3) 
                  (pred_7 ?v6) (pred_4 ?v3 ?v6) (pred_1 ))
:effect (and (pred_6 ?v3)
   (not (pred_4 ?v3 ?v6)) (not (pred_1 ))))


(:action op_1
:parameters (?v6 ?v8 ?v5)
:precondition (and (pred_3 ?v6) (pred_8 ?v8) (pred_8 ?v5)
                  (pred_7 ?v6) (pred_6 ?v5) (pred_4 ?v8 ?v6))
:effect (and (pred_6 ?v8) (pred_4 ?v5 ?v6)
        (not (pred_6 ?v5)) (not (pred_4 ?v8 ?v6))))

(:action op_2
:parameters (?v6 ?v3)
:precondition (and (pred_3 ?v6) (pred_8 ?v3) 
                  (pred_7 ?v6) (pred_6 ?v3))
:effect (and (pred_1 ) (pred_4 ?v3 ?v6) (not (pred_6 ?v3)))))


	
