(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_2
obj_03 obj_09 - type_1
obj_02 obj_04 obj_10 obj_01 - type_3
obj_05 obj_06 obj_07 - object)
(:init
(pred_3 obj_08 obj_02)
(pred_4 obj_08 obj_03)
(pred_4 obj_08 obj_09)
(pred_2 obj_05 obj_01)
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_06 obj_10)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_09))))
)
)