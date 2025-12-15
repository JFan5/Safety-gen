(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_06 obj_05 - type_3
obj_10 obj_03 obj_09 obj_01 - type_2
obj_08 obj_02 obj_04 - object)
(:init
(pred_3 obj_07 obj_01)
(pred_4 obj_07 obj_06)
(pred_4 obj_07 obj_05)
(pred_2 obj_08 obj_10)
(pred_2 obj_02 obj_10)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_09)
(pred_2 obj_02 obj_03)
(pred_2 obj_04 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_06))))
)
)