(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_07 obj_09 - type_3
obj_01 obj_10 obj_08 obj_03 - type_2
obj_06 obj_05 obj_04 - object)
(:init
(pred_3 obj_02 obj_08)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_09)
(pred_2 obj_06 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_04 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_09))))
)
)