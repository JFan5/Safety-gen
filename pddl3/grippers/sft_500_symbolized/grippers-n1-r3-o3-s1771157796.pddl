(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_07 obj_09 - type_2
obj_04 obj_06 obj_03 - type_3
obj_01 obj_08 obj_05 - object)
(:init
(pred_1 obj_02 obj_06)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_09)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_04)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_04)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_09))))
)
)