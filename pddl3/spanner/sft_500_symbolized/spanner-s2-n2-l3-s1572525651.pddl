; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1572525651 --problem-name spanner-s2-n2-l3-s1572525651
(define (problem spanner-s2-n2-l3-s1572525651)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_01 obj_07 - type_5
     obj_06 obj_04 - type_3
     obj_10 obj_05 obj_08 - type_2
     obj_02 obj_03 - type_2
    )
 (:init 
    (pred_4 obj_09 obj_02)
    (pred_4 obj_01 obj_10)
    (pred_3 obj_01)
    (pred_4 obj_07 obj_05)
    (pred_3 obj_07)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_1 obj_02 obj_10)
    (pred_1 obj_08 obj_03)
    (pred_1 obj_10 obj_05)
    (pred_1 obj_05 obj_08)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
