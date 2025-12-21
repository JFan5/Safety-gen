(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_09 obj_02 - type_2
obj_05 obj_03 obj_08 - type_3
obj_06 obj_01 obj_04 - object)
(:init
(pred_1 obj_07 obj_08)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_02)
(pred_2 obj_06 obj_08)
(pred_2 obj_01 obj_08)
(pred_2 obj_04 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_04 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_07 ?b obj_02))))
)
)