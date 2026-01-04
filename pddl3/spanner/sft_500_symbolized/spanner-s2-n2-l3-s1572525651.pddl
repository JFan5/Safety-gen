; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1572525651 --problem-name spanner-s2-n2-l3-s1572525651
(define (problem spanner-s2-n2-l3-s1572525651)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_09 obj_07 - type_2
     obj_03 obj_05 - type_5
     obj_06 obj_04 obj_10 - type_1
     obj_02 obj_01 - type_1
    )
 (:init 
    (pred_4 obj_08 obj_02)
    (pred_4 obj_09 obj_06)
    (pred_6 obj_09)
    (pred_4 obj_07 obj_04)
    (pred_6 obj_07)
    (pred_3 obj_03)
    (pred_4 obj_03 obj_01)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_01)
    (pred_5 obj_02 obj_06)
    (pred_5 obj_10 obj_01)
    (pred_5 obj_06 obj_04)
    (pred_5 obj_04 obj_10)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
