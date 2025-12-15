(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_2
obj_10 obj_12 obj_11 obj_02 - type_3
obj_13 obj_06 obj_04 obj_01 - type_1
obj_03 obj_09 obj_08 - object)
(:init
(pred_3 obj_05 obj_04)
(pred_2 obj_05 obj_10)
(pred_2 obj_05 obj_12)
(pred_3 obj_07 obj_01)
(pred_2 obj_07 obj_11)
(pred_2 obj_07 obj_02)
(pred_4 obj_03 obj_04)
(pred_4 obj_09 obj_06)
(pred_4 obj_08 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_06)
(pred_4 obj_09 obj_06)
(pred_4 obj_08 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_04) (pred_3 obj_07 obj_04))))
  )
)
)