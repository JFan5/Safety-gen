; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1533218881 --problem-name spanner-s2-n2-l3-s1533218881
(define (problem spanner-s2-n2-l3-s1533218881)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_09 obj_05 - type_5
     obj_06 obj_07 - type_1
     obj_04 obj_10 obj_08 - type_2
     obj_03 obj_01 - type_2
    )
 (:init 
    (pred_5 obj_02 obj_03)
    (pred_5 obj_09 obj_10)
    (pred_6 obj_09)
    (pred_5 obj_05 obj_08)
    (pred_6 obj_05)
    (pred_1 obj_06)
    (pred_5 obj_06 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_01)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_08 obj_01)
    (pred_2 obj_04 obj_10)
    (pred_2 obj_10 obj_08)
)
 (:goal
  (and
   (pred_4 obj_06)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_06)) (not (pred_4 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
