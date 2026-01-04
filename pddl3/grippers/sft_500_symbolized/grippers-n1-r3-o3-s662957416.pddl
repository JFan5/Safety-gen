(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_07 obj_09 - type_2
obj_01 obj_03 obj_06 - type_3
obj_02 obj_08 obj_05 - object)
(:init
(pred_3 obj_04 obj_03)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_09)
(pred_2 obj_02 obj_06)
(pred_2 obj_08 obj_03)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_08 obj_03)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_09))))
)
)