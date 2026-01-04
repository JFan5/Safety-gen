(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_09 obj_06 - type_2
obj_05 obj_10 obj_01 obj_03 - type_3
obj_04 obj_02 obj_07 - object)
(:init
(pred_3 obj_08 obj_03)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_06)
(pred_1 obj_04 obj_10)
(pred_1 obj_02 obj_01)
(pred_1 obj_07 obj_03)
)
(:goal
(and
(pred_1 obj_04 obj_01)
(pred_1 obj_02 obj_05)
(pred_1 obj_07 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_09))))
)
)