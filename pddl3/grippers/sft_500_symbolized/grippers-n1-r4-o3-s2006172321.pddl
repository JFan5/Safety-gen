(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_07 obj_09 - type_2
obj_02 obj_03 obj_01 obj_10 - type_3
obj_08 obj_06 obj_04 - object)
(:init
(pred_1 obj_05 obj_02)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_09)
(pred_2 obj_08 obj_03)
(pred_2 obj_06 obj_02)
(pred_2 obj_04 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_01)
(pred_2 obj_06 obj_10)
(pred_2 obj_04 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_09))))
)
)