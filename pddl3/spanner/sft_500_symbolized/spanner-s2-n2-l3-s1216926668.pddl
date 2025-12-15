; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1216926668 --problem-name spanner-s2-n2-l3-s1216926668
(define (problem spanner-s2-n2-l3-s1216926668)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_07 obj_02 - type_4
     obj_05 obj_04 - type_2
     obj_09 obj_06 obj_08 - type_5
     obj_10 obj_03 - type_5
    )
 (:init 
    (pred_1 obj_01 obj_10)
    (pred_1 obj_07 obj_08)
    (pred_4 obj_07)
    (pred_1 obj_02 obj_06)
    (pred_4 obj_02)
    (pred_5 obj_05)
    (pred_1 obj_05 obj_03)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_03)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_09 obj_06)
    (pred_6 obj_06 obj_08)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
