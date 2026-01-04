; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1216926668 --problem-name spanner-s2-n2-l3-s1216926668
(define (problem spanner-s2-n2-l3-s1216926668)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_01 obj_03 - type_5
     obj_10 obj_05 - type_3
     obj_07 obj_04 obj_02 - type_2
     obj_06 obj_08 - type_2
    )
 (:init 
    (pred_4 obj_09 obj_06)
    (pred_4 obj_01 obj_02)
    (pred_2 obj_01)
    (pred_4 obj_03 obj_04)
    (pred_2 obj_03)
    (pred_5 obj_10)
    (pred_4 obj_10 obj_08)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_1 obj_06 obj_07)
    (pred_1 obj_02 obj_08)
    (pred_1 obj_07 obj_04)
    (pred_1 obj_04 obj_02)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
