; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1067637600 --problem-name spanner-s2-n2-l3-s1067637600
(define (problem spanner-s2-n2-l3-s1067637600)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_07 obj_10 - type_4
     obj_06 obj_03 - type_5
     obj_04 obj_09 obj_05 - type_1
     obj_08 obj_01 - type_1
    )
 (:init 
    (pred_2 obj_02 obj_08)
    (pred_2 obj_07 obj_09)
    (pred_5 obj_07)
    (pred_2 obj_10 obj_09)
    (pred_5 obj_10)
    (pred_3 obj_06)
    (pred_2 obj_06 obj_01)
    (pred_3 obj_03)
    (pred_2 obj_03 obj_01)
    (pred_1 obj_08 obj_04)
    (pred_1 obj_05 obj_01)
    (pred_1 obj_04 obj_09)
    (pred_1 obj_09 obj_05)
)
 (:goal
  (and
   (pred_4 obj_06)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_06)) (not (pred_4 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
