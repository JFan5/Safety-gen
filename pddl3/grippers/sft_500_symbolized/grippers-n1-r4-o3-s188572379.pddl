(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_01 obj_04 - type_2
obj_05 obj_02 obj_08 obj_06 - type_3
obj_09 obj_10 obj_07 - object)
(:init
(pred_1 obj_03 obj_06)
(pred_3 obj_03 obj_01)
(pred_3 obj_03 obj_04)
(pred_2 obj_09 obj_08)
(pred_2 obj_10 obj_05)
(pred_2 obj_07 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_02)
(pred_2 obj_10 obj_08)
(pred_2 obj_07 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_04))))
)
)