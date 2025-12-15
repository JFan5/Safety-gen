(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_11 obj_10 obj_01 obj_06 - type_2
obj_05 obj_08 obj_04 - type_3
obj_02 obj_07 obj_03 - object)
(:init
(pred_2 obj_12 obj_04)
(pred_3 obj_12 obj_11)
(pred_3 obj_12 obj_10)
(pred_2 obj_09 obj_08)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_06)
(pred_1 obj_02 obj_08)
(pred_1 obj_07 obj_08)
(pred_1 obj_03 obj_04)
)
(:goal
(and
(pred_1 obj_02 obj_04)
(pred_1 obj_07 obj_04)
(pred_1 obj_03 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_12 obj_04) (pred_2 obj_09 obj_04))))
  )
)
)