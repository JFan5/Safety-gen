; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1882528215 --problem-name spanner-s2-n2-l3-s1882528215
(define (problem spanner-s2-n2-l3-s1882528215)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_09 obj_03 - type_5
     obj_06 obj_05 - type_4
     obj_10 obj_01 obj_04 - type_2
     obj_08 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_08)
    (pred_2 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_2 obj_03 obj_04)
    (pred_1 obj_03)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_02)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_02)
    (pred_6 obj_08 obj_10)
    (pred_6 obj_04 obj_02)
    (pred_6 obj_10 obj_01)
    (pred_6 obj_01 obj_04)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
