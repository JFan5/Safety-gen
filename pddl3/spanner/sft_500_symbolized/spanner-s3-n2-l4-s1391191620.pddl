; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1391191620 --problem-name spanner-s3-n2-l4-s1391191620
(define (problem spanner-s3-n2-l4-s1391191620)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_06 obj_11 obj_01 - type_2
     obj_09 obj_05 - type_5
     obj_12 obj_02 obj_04 obj_03 - type_1
     obj_10 obj_08 - type_1
    )
 (:init 
    (pred_2 obj_07 obj_10)
    (pred_2 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_2 obj_11 obj_04)
    (pred_4 obj_11)
    (pred_2 obj_01 obj_03)
    (pred_4 obj_01)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_08)
    (pred_3 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_5 obj_10 obj_12)
    (pred_5 obj_03 obj_08)
    (pred_5 obj_12 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_5 obj_04 obj_03)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
