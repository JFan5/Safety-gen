(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_2
obj_08 obj_09 - type_1
obj_04 obj_02 obj_06 - type_3
obj_03 obj_01 obj_07 - object)
(:init
(pred_1 obj_05 obj_06)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_09)
(pred_2 obj_03 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_07 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_01 obj_06)
(pred_2 obj_07 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_05 ?b obj_09))))
)
)