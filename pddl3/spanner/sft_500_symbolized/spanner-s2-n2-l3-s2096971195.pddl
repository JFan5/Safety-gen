; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 2096971195 --problem-name spanner-s2-n2-l3-s2096971195
(define (problem spanner-s2-n2-l3-s2096971195)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_05 obj_07 - type_2
     obj_06 obj_08 - type_3
     obj_02 obj_03 obj_09 - type_4
     obj_01 obj_04 - type_4
    )
 (:init 
    (pred_3 obj_10 obj_01)
    (pred_3 obj_05 obj_03)
    (pred_6 obj_05)
    (pred_3 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_04)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_03 obj_09)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
