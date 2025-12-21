(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_02 obj_04 - type_2
obj_06 obj_10 obj_01 obj_05 - type_3
obj_07 obj_08 obj_09 - object)
(:init
(pred_1 obj_03 obj_10)
(pred_3 obj_03 obj_02)
(pred_3 obj_03 obj_04)
(pred_2 obj_07 obj_05)
(pred_2 obj_08 obj_01)
(pred_2 obj_09 obj_06)
)
(:goal
(and
(pred_2 obj_07 obj_10)
(pred_2 obj_08 obj_06)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_04))))
)
)