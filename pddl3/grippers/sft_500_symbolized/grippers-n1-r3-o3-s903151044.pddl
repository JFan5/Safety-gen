(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_03 obj_09 - type_3
obj_04 obj_06 obj_07 - type_2
obj_02 obj_01 obj_05 - object)
(:init
(pred_4 obj_08 obj_06)
(pred_1 obj_08 obj_03)
(pred_1 obj_08 obj_09)
(pred_3 obj_02 obj_07)
(pred_3 obj_01 obj_04)
(pred_3 obj_05 obj_06)
)
(:goal
(and
(pred_3 obj_02 obj_07)
(pred_3 obj_01 obj_06)
(pred_3 obj_05 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_09))))
)
)