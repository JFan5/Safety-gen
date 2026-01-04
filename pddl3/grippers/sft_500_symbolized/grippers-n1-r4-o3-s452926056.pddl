(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_05 obj_08 - type_2
obj_10 obj_07 obj_01 obj_09 - type_1
obj_03 obj_02 obj_06 - object)
(:init
(pred_1 obj_04 obj_09)
(pred_4 obj_04 obj_05)
(pred_4 obj_04 obj_08)
(pred_2 obj_03 obj_01)
(pred_2 obj_02 obj_10)
(pred_2 obj_06 obj_09)
)
(:goal
(and
(pred_2 obj_03 obj_01)
(pred_2 obj_02 obj_10)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_04 ?b obj_08))))
)
)